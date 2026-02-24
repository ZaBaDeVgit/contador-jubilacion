$ErrorActionPreference = "Stop"

$sourceCode = @'
using System;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;

class Program
{
    [STAThread]
    static void Main()
    {
        string appPath = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
        string htmlPath = Path.Combine(appPath, "index.html");
        
        if (File.Exists(htmlPath))
        {
            Process.Start(new ProcessStartInfo
            {
                FileName = htmlPath,
                UseShellExecute = true
            });
        }
        else
        {
            MessageBox.Show("No se encontró index.html", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }
}
'@

Add-Type -TypeDefinition $sourceCode -OutputAssembly "C:\contador-jubilacion\MiJubilacion.exe" -OutputType ConsoleApplication -ReferencedAssemblies System.Windows.Forms

Write-Host "Ejecutable creado: C:\contador-jubilacion\MiJubilacion.exe"
