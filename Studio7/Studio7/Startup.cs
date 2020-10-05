using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Studio7.Startup))]
namespace Studio7
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
