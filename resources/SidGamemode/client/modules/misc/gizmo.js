let token = null;

class Gizmo {
    static _entity = null;
    static _active = false;
    static _matrix = null;
    static _cursor = null;
    static _view = 1;

    static getMatrix() {
        const [f, r, u, a] = GetEntityMatrix(Gizmo._entity);

        return new Float32Array([
            r[0], r[1], r[2], 0,
            f[0], f[1], f[2], 0,
            u[0], u[1], u[2], 0,
            a[0], a[1], a[2], 1,
        ]);
    }

	static extractRotationFromMatix() {
		const rotation = { x: 0.0, y: 0.0, z: 0.0 }

		let c;

		rotation.y = Math.asin(Gizmo._matrix[8])
		c = Math.cos(rotation.y)

		if (Math.abs(c>1e-20)) c = 1.0 / c;
		else c = 0.0;

		rotation.x = Math.atan2(-Gizmo._matrix[9] * c, Gizmo._matrix[10] * c)
		rotation.z = Math.atan2(-Gizmo._matrix[4] * c, Gizmo._matrix[0] * c)

		return {
			x: rotation.x * (180 / Math.PI),
			y: rotation.y * (180 / Math.PI),
			z: rotation.z * (180 / Math.PI),
		}
	}

    static applyMatrix() {
        const mat = Gizmo._matrix;

		if(exports.SidGamemode.getRoutingBucket() !== 1 || exports.SidGamemode.isMod()) {
			SetEntityMatrix(
				Gizmo._entity,
				mat[4], mat[5], mat[6],
				mat[0], mat[1], mat[2],
				mat[8], mat[9], mat[10],
			);
		} else {
			const { x, y, z } = this.extractRotationFromMatix()

			SetEntityRotation(Gizmo._entity, x, y, z, 0, false)
		}

        SetEntityCoordsNoOffset(Gizmo._entity, mat[12], mat[13], mat[14], false, false, false);
    }

    static draw() {
        return DrawGizmo(Gizmo._matrix, 'OutroGizmo');
    }

    static tick() {
        if (!Gizmo._entity) return;

		if (Gizmo._cursor) {
			DisableControlAction(0, 1, true);
			DisableControlAction(0, 2, true);
		}

        DisableControlAction(0, 14, true);
        DisableControlAction(0, 15, true);
        DisableControlAction(0, 16, true);
        DisableControlAction(0, 17, true);
        DisableControlAction(0, 24, true);
        DisableControlAction(0, 25, true);
        DisableControlAction(0, 44, true);
        DisableControlAction(0, 140, true);
        DisableControlAction(0, 142, true);
        DisableControlAction(0, 257, true);
        DisableControlAction(0, 261, true);
        DisableControlAction(0, 262, true);

        SetEntityDrawOutline(Gizmo._entity, true);

        if (Gizmo.draw()) {
            Gizmo.applyMatrix();
        }
    }

    static use(entity) {
        EnterCursorMode();
        SetEntityDrawOutlineShader(Gizmo._view);
        SetEntityDrawOutlineColor(0, 181, 254, 255);

        emit('outro:gizmo:instructional', token, true)

        Gizmo._active = true;
        Gizmo._cursor = true;
        Gizmo._entity = entity;
        Gizmo._matrix = Gizmo.getMatrix();

        const tick = setTick(() => {
            if (Gizmo._active) {
                Gizmo.tick();
            }

            if (IsControlJustPressed(0, 177)) {
                Gizmo._active = false;

                clearTick(tick);
                LeaveCursorMode();
                SetEntityDrawOutline(Gizmo._entity, false);
				emit('outro:gizmo:instructional', token, false)
                emit('outro:decoration:move', token, Gizmo._entity);
            }

			if (IsDisabledControlJustPressed(0, 44)) {
				Gizmo._cursor = !Gizmo._cursor;
                
				if (Gizmo._cursor) {
					EnterCursorMode();
				} else {
					LeaveCursorMode();
				}
            }
        }, 0);
    }

}

RegisterCommand('+gizmoView', () => {
    if (Gizmo._entity) {
        if (Gizmo._view === 2) {
            Gizmo._view = 0;
        } else {
            Gizmo._view += 1;
        }
        SetEntityDrawOutlineShader(Gizmo._view);
        SetEntityDrawOutlineColor(0, 181, 254, Gizmo._view === 2 ? 100 : 255);
    }
}, false);

RegisterKeyMapping("+gizmoSelect", "Touche pas", "MOUSE_BUTTON", "MOUSE_LEFT")
RegisterKeyMapping("+gizmoTranslation", "Gizmo mode translation", "keyboard", "E")
RegisterKeyMapping("+gizmoRotation", "Gizmo mode rotation", "keyboard", "R")
RegisterKeyMapping("+gizmoScale", "Gizmo mode taille", "keyboard", "Y")
RegisterKeyMapping("+gizmoLocal", "Gizmo mode local / global", "keyboard", "L")
RegisterKeyMapping("+gizmoView", "Gizmo mode de vue", "keyboard", "M")

exports('Use', Gizmo.use);

on('outro:gizmo', (_, entity) => {
	setTimeout(() => {
		Gizmo.use(entity);
	}, 100)
    token = _;
});
