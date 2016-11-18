module.exports = () => ({
  digital_ocean_token: process.env.DIGITALOCEAN_TOKEN,
  ssh_public_key_path: process.env.SSH_PUBLIC_KEY_PATH || process.env.HOME + '/.ssh/id_rsa.pub'
})
