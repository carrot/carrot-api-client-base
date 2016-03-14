export function request (client, overrides, opts) {
  return client(Object.assign(opts, overrides))
    .then((res) => { return res.entity })
}
