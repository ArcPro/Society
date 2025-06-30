const waitFor = (ms: number) =>
  new Promise((resolve) => setTimeout(resolve, ms));

const resource = () => {
  //@ts-ignore
  return import.meta.env.DEV ? "development" : GetParentResourceName();
};

export { waitFor, resource };
