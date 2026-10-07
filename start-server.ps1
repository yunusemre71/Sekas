# SEKAS yerel sunucusu (Windows'ta hazir gelen PowerShell ile calisir, ek kurulum gerekmez)
param([int]$Port = 8765)
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$mime = @{
  '.html'='text/html; charset=utf-8'; '.js'='text/javascript; charset=utf-8'; '.json'='application/json';
  '.webp'='image/webp'; '.png'='image/png'; '.jpg'='image/jpeg'; '.jpeg'='image/jpeg'; '.svg'='image/svg+xml';
  '.css'='text/css'; '.mp3'='audio/mpeg'; '.ogg'='audio/ogg'; '.wav'='audio/wav'; '.glb'='model/gltf-binary';
  '.woff'='font/woff'; '.woff2'='font/woff2'; '.ico'='image/x-icon'
}
$l = New-Object System.Net.HttpListener
$l.Prefixes.Add("http://localhost:$Port/")
try { $l.Start() } catch { exit 1 }   # port zaten dolu = sunucu zaten calisiyor
while ($l.IsListening) {
  $c = $l.GetContext()
  try {
    $p = [Uri]::UnescapeDataString($c.Request.Url.AbsolutePath)
    if ($p -eq '/') { $p = '/index.html' }
    $f = [IO.Path]::GetFullPath((Join-Path $root $p.TrimStart('/')))
    if ($f.StartsWith($root) -and [IO.File]::Exists($f)) {
      $b = [IO.File]::ReadAllBytes($f)
      $t = $mime[[IO.Path]::GetExtension($f).ToLower()]
      if (-not $t) { $t = 'application/octet-stream' }
      $c.Response.ContentType = $t
      $c.Response.AddHeader('Cache-Control', 'no-cache')
      $c.Response.ContentLength64 = $b.Length
      $c.Response.OutputStream.Write($b, 0, $b.Length)
    } else { $c.Response.StatusCode = 404 }
  } catch { try { $c.Response.StatusCode = 500 } catch {} }
  try { $c.Response.Close() } catch {}
}
