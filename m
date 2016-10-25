Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.165])
	by mail.openembedded.org (Postfix) with ESMTP id 53C3871A6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 07:28:28 +0000 (UTC)
Received: from [195.245.230.51] by server-5.bemta-3.messagelabs.com id
	38/40-02110-D990F085; Tue, 25 Oct 2016 07:28:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUhTYRTG9+7u42qbXqfiaVjhNNJyfgeCFWJ
	ERiCG/SEm2TWv23Jzcu+sFURGKalgWQm6mFk0yUpCU9OKSsNpE5WVYUQq4rJtQiDiR1jZrlfN
	/vud8zzveQ68B8dk00I5ThkNFF1IahUib8GBffhxpdnLNzOmplaUWNlsEyV+/flDnFg2akLJW
	Op8mU9ql2lMnDrU8hClY1lCTWGu3nhKqK7uWBIVWaOMg9YhQQkyKyuQNy4jSvnQd3NJyBVWBN
	2OejFX2BE0OSY8hRcuIg5D+/gEn+UAIh5WGlsFrAkjqhDYHM1YBcJxfyIN2sZOshhApMNUzUH
	OngKvJp4iti0gdsKzhTNsW0okgL2zRcBFTSCwvPssZAUvIhm+9TSvsow4CgOzdzCWEREGL8ba
	EMsYEQRfHHdX1wEiACbtAyKOA8E19UfIcRi46q6scSQMjjoQxzHQbnkt4DgEnFfnMG7mBbjbX
	87nlvOD93UOwQ0Epk1xpk020yYb14+A0ufLYo73QOO9GYzj/fDmU9Ma74WZ3lnEcQjcrpwUNy
	D8EQpnKPosRSvj4qJyaY1KbdCRGq0yNiY+SkcxDKmitGQuE3Var2tFnv+/xOOhTlTTn9aDtuJ
	8RaD08pxPpswnV593Xk0y6hy6WEsxPSgYxxUgbcd9M2V+NKWijPkareeI1mXAJYoAqZuVpUwR
	qWM0Kk6yoRB5kLSBFQhWUBcXbjxbP78PaJvcX4p4PJ5MUkTROo3hf92NgnCk8OfSJZpCw8Z0t
	yeY7wn2y5GwwQbynyQvQYE5vQ/MwdufKGzfrQV823zvS4veOXcronWaTor82N7TVhpR3pmUsS
	sIdoz4T0aHqlOM432P82XuAYuc6pB3nzCbvax5vxYXlcNHwm3HnF3LzpGLJn2gxV0/nN319ne
	4lli57srKri1GVREJ0QuuDHv1/XOaQxBaozIVXNuiEDBqMnY3RjPkX54xXGF5AwAA
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-5.tower-33.messagelabs.com!1477380508!22896430!1
X-Originating-IP: [62.60.8.84]
X-StarScan-Received: 
X-StarScan-Version: 9.0.13; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9253 invoked from network); 25 Oct 2016 07:28:29 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
	by server-5.tower-33.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 25 Oct 2016 07:28:29 -0000
Received: from R01UKEXCASM121.r01.fujitsu.local (ex2k13_121.fs.fujitsu.com
	[10.183.43.173])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	u9P7R170024191
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 25 Oct 2016 08:27:01 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
	R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP
	Server (TLS) id 15.0.1178.4; Tue, 25 Oct 2016 08:28:28 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
	by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22])
	with mapi id 15.00.1178.000; Tue, 25 Oct 2016 08:28:28 +0100
From: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To: "anders@chargestorm.se" <anders@chargestorm.se>
Thread-Topic: [OE-core] meta-toolchain and meta-toolchain-qt for specific image
Thread-Index: AQHSKn4cfkqmD2imBU+ewOpqGcX0c6Cwz3YAgAYrGACAAcJzgA==
Date: Tue, 25 Oct 2016 07:28:27 +0000
Message-ID: <1477380507.4894.4.camel@ts.fujitsu.com>
References: <58072ca7.c70f420a.fed0f.74b1SMTPIN_ADDED_BROKEN@mx.google.com>
	<432953B0-59CB-4E94-A670-C4BD4A12C88A@gmail.com>
	<1476944666.6754.1.camel@ts.fujitsu.com>
	<20161024043614.3gqmsqpu2h52tnpr@ad.chargestorm.se>
In-Reply-To: <20161024043614.3gqmsqpu2h52tnpr@ad.chargestorm.se>
Reply-To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Accept-Language: de-DE, en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.22.1-0ubuntu2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.183.43.206]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain and meta-toolchain-qt for specific image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Oct 2016 07:28:29 -0000
X-Groupsio-MsgNum: 88568
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-nLY1015V0KhbwojifwnY"

--=-nLY1015V0KhbwojifwnY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey

> Well, have your image `inherit populate_sdk_qt5`, and then call
>=20
> `bitbake <your-image> -c populate_sdk`. That'll give you the standard,
> image-based SDK, with Qt5 in it.
>=20
Can the image and the sdk be build seperatly then? Or will a "bitbake <my-=
image>" build the qt5 toolchain directly too?
This is what I intended to get rid off. To be able to build the image and =
the sdk in two independed build steps.

Cheers,
Thilo

--=-nLY1015V0KhbwojifwnY
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIM6DCCA9Qw
ggK8oAMCAQICEDTNElfINoNG4L/3PTADbgUwDQYJKoZIhvcNAQEFBQAwLzEtMCsGA1UEAxMkRnVq
aXRzdSBUZWNobm9sb2d5IFNvbHV0aW9ucyBSb290IENBMB4XDTA5MDMxMjEyMjQ1OVoXDTE5MDMx
MTEyMjQ1OVowLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0aW9ucyBVc2VyIENB
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsBtNf0fN8EkW9y6QqoQGS6LUwezenV2B
nDzORdGanukRtpGzYMAPdyiwtlp0/zONa+jCJGzkX4iYCjTsiJvx01SPRNZ24fHaFGXpJBX599q6
ZF0isu+h1aIas1tfyCBalAbKKLvNgIuQjnXhdffVk4vSuBytO3OGcULtJ2+lYVSEvxzGt9iTSwT5
RnEvKpR0iOC+9/UNVOiPK9XCz5u7bg3iehP5gD+v5uu3YIRwV/5gyd7AZPcckTfYP/GZcybcAXfE
l5nb/bZiSLHeZEjxMMM8YZqFKhH9xymIdjkcRK7NJ2j8OD708QFv4b4bme1mHGfTjSbxb1nOoUTs
NtshZwIDAQABo4HrMIHoMB0GA1UdDgQWBBQI9chqv4Dje1DEOfQHmEbobX6XqDALBgNVHQ8EBAMC
AYYwHwYDVR0jBBgwFoAUFHXiV7YVNxWAKpflUUhlrM+GkMswEgYDVR0TAQH/BAgwBgEB/wIBADBH
BggrBgEFBQcBAQQ7MDkwNwYIKwYBBQUHMAKGK2h0dHA6Ly9haWEudHMuZnVqaXRzdS5jb20vYWlh
L2Z0czAxcm9vdC5jZXIwPAYDVR0fBDUwMzAxoC+gLYYraHR0cDovL2NkcC50cy5mdWppdHN1LmNv
bS9jZHAvZnRzMDFyb290LmNybDANBgkqhkiG9w0BAQUFAAOCAQEAQ7pQP9Lw9bcnt1DhvV5UWb1z
mnACSo6n6x+bupckQzlrf3aJ7HQZigZuaCak+dexL18I86iNDDOJBBsrz0DcD4XPszcLTUezqqGl
AyIbviBq5mwDHAWBA9F11GRx6LdrHMKNdHPwAWyC3r6qv4GO6A+z16KUZFSP4kvuaN5YHI481T7F
FxEmntkylphndX+6mQ1NABApMMhX0aN5dVhPAMAP8nENJ1hGk81IG8gzkoHDPSoLCtffAnNhYAqh
vrDO2ybXb/9x+Sf3DQuzBg3hpB1yJM3K8foQaS3uTpFITfdMprcQyrIdl4Jw26s/6vpIs0siLVTp
3yAwgNaqQSgxSTCCBIQwggNsoAMCAQICCiWUlIAAAAACJH0wDQYJKoZIhvcNAQEFBQAwLzEtMCsG
A1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0aW9ucyBVc2VyIENBMB4XDTE0MDMyMTEyMTM1
M1oXDTE3MDMyMDEyMTM1M1owQjEZMBcGA1UEAwwQQ2VzdG9uYXJvLCBUaGlsbzElMCMGA1UECgwc
RnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0aW9uczCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA
qP3ld/ylkJOTj2rXQ+VrRf/+YMgZS5CGDnMWk+sMoS5f6JqtwfGcfBU/DhfnLsePut2q+ex/RDZF
M6yCraPS0vdnTKm2O3Q7/UhhAV1Mi4XzzGeY1Y0qm+85EgMBISPwB5mThLYPsun5UIFs6e8tvlwZ
Rzp/jrv/AzAfsSbHGXcCAwEAAaOCAhEwggINMAsGA1UdDwQEAwIFoDByBgNVHREEazBpgR50aGls
by5jZXN0b25hcm9AdHMuZnVqaXRzdS5jb22BI1RoaWxvLkNlc3RvbmFyb0BmdWppdHN1LXNpZW1l
bnMuY29tgSIrNDk4MjE4MDQ4MjMyOEBpbmNvbWluZ2ZheC5mc2MubmV0MB0GA1UdDgQWBBSiHLgI
jjo+7KxLJ4t1+YZxgBSn8TAfBgNVHSMEGDAWgBQI9chqv4Dje1DEOfQHmEbobX6XqDA8BgNVHR8E
NTAzMDGgL6AthitodHRwOi8vY2RwLnRzLmZ1aml0c3UuY29tL2NkcC9mdHMwMXVzZXIuY3JsMEcG
CCsGAQUFBwEBBDswOTA3BggrBgEFBQcwAoYraHR0cDovL2FpYS50cy5mdWppdHN1LmNvbS9haWEv
ZnRzMDF1c2VyLmNlcjAMBgNVHRMBAf8EAjAAMD0GCSsGAQQBgjcVBwQwMC4GJisGAQQBgjcVCIWF
xDKBh/9hgYWBBIbsgiCBx4EaeYOIoHGH0vEvAgFkAgEIMBMGA1UdJQQMMAoGCCsGAQUFBwMEMBsG
CSsGAQQBgjcVCgQOMAwwCgYIKwYBBQUHAwQwRAYJKoZIhvcNAQkPBDcwNTAOBggqhkiG9w0DAgIC
AIAwDgYIKoZIhvcNAwQCAgCAMAcGBSsOAwIHMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBBQUAA4IB
AQAEGTAyHPmTyCR029H+P/u9xRezlfA2OVvV97Ls/oLCXGGr6EkMvpHodTc6n4EWSb2ul3VPSRQf
uSmBgIcHQJykHdSChisaqkeOpHG0rjM9GXh2eQ7ECovpQIfdIbRZKNxlJihSDsDWHyZldBlPVbDh
xMeT6xJ/ylF8UQ8FXKUir6W/BSPZF5kLdsmCeOpWC4jOGNPEMUAcuiHZPyqAhjlWk750I4oJJKvD
bwO8/mkxmzOjpOsk8O3CdljCjYPoYtJPI/oNVsYdmiokzne4FusPYKDzv5i0dN74KLR48maXvi3/
WsTFqwks45QeBJT/z+1sYy+dYWpv9XGN+jR1o4ImMIIEhDCCA2ygAwIBAgIKJZSUgAAAAAIkfTAN
BgkqhkiG9w0BAQUFADAvMS0wKwYDVQQDEyRGdWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVz
ZXIgQ0EwHhcNMTQwMzIxMTIxMzUzWhcNMTcwMzIwMTIxMzUzWjBCMRkwFwYDVQQDDBBDZXN0b25h
cm8sIFRoaWxvMSUwIwYDVQQKDBxGdWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zMIGfMA0GCSqG
SIb3DQEBAQUAA4GNADCBiQKBgQCo/eV3/KWQk5OPatdD5WtF//5gyBlLkIYOcxaT6wyhLl/omq3B
8Zx8FT8OF+cux4+63ar57H9ENkUzrIKto9LS92dMqbY7dDv9SGEBXUyLhfPMZ5jVjSqb7zkSAwEh
I/AHmZOEtg+y6flQgWzp7y2+XBlHOn+Ou/8DMB+xJscZdwIDAQABo4ICETCCAg0wCwYDVR0PBAQD
AgWgMHIGA1UdEQRrMGmBHnRoaWxvLmNlc3RvbmFyb0B0cy5mdWppdHN1LmNvbYEjVGhpbG8uQ2Vz
dG9uYXJvQGZ1aml0c3Utc2llbWVucy5jb22BIis0OTgyMTgwNDgyMzI4QGluY29taW5nZmF4LmZz
Yy5uZXQwHQYDVR0OBBYEFKIcuAiOOj7srEsni3X5hnGAFKfxMB8GA1UdIwQYMBaAFAj1yGq/gON7
UMQ59AeYRuhtfpeoMDwGA1UdHwQ1MDMwMaAvoC2GK2h0dHA6Ly9jZHAudHMuZnVqaXRzdS5jb20v
Y2RwL2Z0czAxdXNlci5jcmwwRwYIKwYBBQUHAQEEOzA5MDcGCCsGAQUFBzAChitodHRwOi8vYWlh
LnRzLmZ1aml0c3UuY29tL2FpYS9mdHMwMXVzZXIuY2VyMAwGA1UdEwEB/wQCMAAwPQYJKwYBBAGC
NxUHBDAwLgYmKwYBBAGCNxUIhYXEMoGH/2GBhYEEhuyCIIHHgRp5g4igcYfS8S8CAWQCAQgwEwYD
VR0lBAwwCgYIKwYBBQUHAwQwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDBEBgkqhkiG9w0B
CQ8ENzA1MA4GCCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAIAwBwYFKw4DAgcwCgYIKoZIhvcN
AwcwDQYJKoZIhvcNAQEFBQADggEBAAQZMDIc+ZPIJHTb0f4/+73FF7OV8DY5W9X3suz+gsJcYavo
SQy+keh1NzqfgRZJva6XdU9JFB+5KYGAhwdAnKQd1IKGKxqqR46kcbSuMz0ZeHZ5DsQKi+lAh90h
tFko3GUmKFIOwNYfJmV0GU9VsOHEx5PrEn/KUXxRDwVcpSKvpb8FI9kXmQt2yYJ46lYLiM4Y08Qx
QBy6Idk/KoCGOVaTvnQjigkkq8NvA7z+aTGbM6Ok6yTw7cJ2WMKNg+hi0k8j+g1Wxh2aKiTOd7gW
6w9goPO/mLR03vgotHjyZpe+Lf9axMWrCSzjlB4ElP/P7WxjL51ham/1cY36NHWjgiYxggHhMIIB
3QIBATA9MC8xLTArBgNVBAMTJEZ1aml0c3UgVGVjaG5vbG9neSBTb2x1dGlvbnMgVXNlciBDQQIK
JZSUgAAAAAIkfTAJBgUrDgMCGgUAoIH7MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTE2MTAyNTA3MjgyN1owIwYJKoZIhvcNAQkEMRYEFGBJemhra6do1lb2gtvcrudy
/g/0MEwGCSsGAQQBgjcQBDE/MD0wLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0
aW9ucyBVc2VyIENBAgollJSAAAAAAiR9ME4GCyqGSIb3DQEJEAILMT+gPTAvMS0wKwYDVQQDEyRG
dWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVzZXIgQ0ECCiWUlIAAAAACJH0wDQYJKoZIhvcN
AQEBBQAEgYBpeoBa8ZYMsRK54EuB5phKtv3+3LQhByNItpHt9Fchr/h+jZA0or6vBzyvX7vz3KfN
6nAj07HMFin9JtePkgIzfEgQg5/QWwt5c34uvFUyo3ZLCJw281kfCbRngje5HAgiCfRZu/Oq1VGy
vVtMfjXERC/jg6hvAr42iPpwpZZICAAAAAAAAA==

--=-nLY1015V0KhbwojifwnY--
