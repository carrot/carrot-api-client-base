let conf

if (process.env.NODE_ENV === 'test') {
  conf = {
    basePath: 'test_api_url',
    timeout: 10000
  }
} else if (process.env.NODE_ENV === 'production') {
  conf = {
    basePath: 'production_api_url',
    timeout: 2000
  }
} else { // staging
  conf = {
    basePath: 'staging_api_url',
    timeout: 10000
  }
}

export default conf
