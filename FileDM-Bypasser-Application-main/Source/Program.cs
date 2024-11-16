using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;
using System.Net;

namespace FileDM_Bypasser
{
    internal static class Program
    {

        [STAThread]
        private static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            bool flag = args.Length != 0;
            if (flag)
            {
                string text = args[0];
                WebClient webClient = new WebClient();
                string fileName = Path.GetFileName(args[0]);
                string str = fileName.Substring(fileName.LastIndexOf('_') + 1).Substring(0, 5);
                webClient.DownloadString("http://dlsft.com/callback/?channel=HhyWG&id=" + str + "&action=completed");
                webClient.DownloadString("http://dlsft.com/callback/?channel=HhyWG&id=" + str + "&action=searchmanager-0");
                Process.Start("http://dl.filedm.com/dm.php?id=" + str);
            }
        }
    }
}
