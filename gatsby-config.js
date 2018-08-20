module.exports = {
  siteMetadata: {
    title: `Avoinsorsa`,
    subtitle: `Avoinsorsa Gatsby`,
  },
  plugins: [
    {
      resolve: `gatsby-source-wordpress`,
      options: {
        baseUrl: `localhost:8080`,
        protocol: `http`,
        hostingWPCOM: false,
        useACF: false,
      },
    },
  ],
}
