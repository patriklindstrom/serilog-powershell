. .\serilog.ps1
cls
Write-Host "Playing Around"

$test = 1..10 |%{ Write-Host "Number is $_" } | Select-WriteHost -Quiet |?{$_ -like "Number is 1*"}
$test

$source = @"

using Serilog;
using System;
  namespace A{
   public static class Thingy
    {
        public static void Setup()
        {

            var log = new LoggerConfiguration()
                .WriteTo.File("log.txt")
                  .CreateLogger();

            Log.Logger = log;

        }

        public static void LogIt(object thing)
        {
            Log.Information("{0}", thing);
        }
    }  
  }
  
"@

$assemb =  @("C:\Code\serilog-powershell\lib\Serilog.dll", "C:\Code\serilog-powershell\lib\Serilog.FullNetFx.dll")

Add-Type  -TypeDefinition $Source -ReferencedAssemblies $assemb


