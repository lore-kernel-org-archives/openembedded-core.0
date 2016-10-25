Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.138])
	by mail.openembedded.org (Postfix) with ESMTP id 52BD1719E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:04:07 +0000 (UTC)
Received: from [85.158.136.83] by server-2.bemta-5.messagelabs.com id
	1A/70-01972-82C3F085; Tue, 25 Oct 2016 11:04:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGKsWRWlGSWpSXmKPExsViZ8MRoqtuwx9
	hsKGZy6J77Sk2izs/37FbtF2fxejA7PG1jc9j56y77B7nNq5gDGCOYs3MS8qvSGDNOL78H2vB
	MZ2KP4uXszUwntXuYuTiEBJoZZJobXjLCuEcY5RY8Xs6YxcjJ5BzkVFi239bEJtNwF1i6737T
	CC2iICxxP9lm1hAGpgF+hglTj1Zy9zFyMEhLOAnseVuHIgpIhAg8XiqM0S5n8TNuevYQWwWAV
	WJP2cOg43hFTCV6J+znwli7wEmiWuLJ4MlOAUcJL6t+gJ1g7fE6Y+zmUFsRgEViV13t4DFmQX
	EJW49mQ9WLyEgIvHw4mk2CFtU4uXjf6wQtorEy5nNULaOxNnrTxghbAOJrUv3sUDYihIvWj4z
	Q8yskjj/ZScLxHGCEidnPmGZwCgxC8m6WUjKZiEpg4hrSrRu/80OYWtLLFv4mhnCtpXYf3Ull
	G0q8froR0YIW1FiSvdD9gWMHKsYNYpTi8pSi3QNDfWSijLTM0pyEzNzdA0NTPVyU4uLE9NTcx
	KTivWS83M3MQLjnwEIdjCubHc+xCjJwaQkytv4mS9CiC8pP6UyI7E4I76oNCe1+BCjDAeHkgR
	vrRV/hJBgUWp6akVaZg4wEcGkJTh4lER4d4KkeYsLEnOLM9MhUqcYFaXEeXlAEgIgiYzSPLg2
	WPK7xCgrJczLCHSIEE9BalFuZgmq/CtGcQ5GJWHewyBTeDLzSuCmvwJazAS0WDCeB2RxSSJCS
	qqB0T3B2SeA2fDsCUsjZpP1Bx2l2655PHTYdsZd/969jO/sa3sfME3yLvi//V0JU7Ur33ftA+
	9+PavI/lr8OUv4zOGN7A6rC68IxdYvKWjdxvLF5T4r4y8W30Zr1bkddhc2rlmQn3j16rtL5r9
	1fzjymWy/6yH19N6Orhsr1qauuF7ZH+q6YL9gshJLcUaioRZzUXEiANjLObt5AwAA
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-6.tower-36.messagelabs.com!1477393447!65737975!1
X-Originating-IP: [62.60.8.84]
X-StarScan-Received: 
X-StarScan-Version: 9.0.13; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16752 invoked from network); 25 Oct 2016 11:04:07 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
	by server-6.tower-36.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 25 Oct 2016 11:04:07 -0000
Received: from R01UKEXCASM121.r01.fujitsu.local (ex2k13_121.fs.fujitsu.com
	[10.183.43.173])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	u9PB2XcI009617
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 25 Oct 2016 12:02:33 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
	R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP
	Server (TLS) id 15.0.1178.4; Tue, 25 Oct 2016 12:04:00 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
	by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22])
	with mapi id 15.00.1178.000; Tue, 25 Oct 2016 12:04:00 +0100
From: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To: "anders@chargestorm.se" <anders@chargestorm.se>
Thread-Topic: [OE-core] meta-toolchain and meta-toolchain-qt for specific image
Thread-Index: AQHSKn4cfkqmD2imBU+ewOpqGcX0c6Cwz3YAgAYrGACAAcJzgIAABdaAgAA2YQA=
Date: Tue, 25 Oct 2016 11:03:59 +0000
Message-ID: <1477393438.20929.3.camel@ts.fujitsu.com>
References: <58072ca7.c70f420a.fed0f.74b1SMTPIN_ADDED_BROKEN@mx.google.com>
	<432953B0-59CB-4E94-A670-C4BD4A12C88A@gmail.com>
	<1476944666.6754.1.camel@ts.fujitsu.com>
	<20161024043614.3gqmsqpu2h52tnpr@ad.chargestorm.se>
	<1477380507.4894.4.camel@ts.fujitsu.com>
	<20161025074921.sqpe3dup4jqkcqe5@ad.chargestorm.se>
In-Reply-To: <20161025074921.sqpe3dup4jqkcqe5@ad.chargestorm.se>
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
X-List-Received-Date: Tue, 25 Oct 2016 11:04:09 -0000
X-Groupsio-MsgNum: 88583
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-tQkk0EbrshBrS7wPbas/"

--=-tQkk0EbrshBrS7wPbas/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


> Yes, `bitbake <my-image>` does only build your image and `bitbake
> <my-image> -c populate_sdk` does only build the SDK.=C2=A0
>=20
Then I will give it a try!
Thanks!

Cheers,
Thilo

--=-tQkk0EbrshBrS7wPbas/
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
hvcNAQkFMQ8XDTE2MTAyNTExMDM1OFowIwYJKoZIhvcNAQkEMRYEFGNim++WLpv3+FQtRZNn4/MK
ZfGrMEwGCSsGAQQBgjcQBDE/MD0wLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0
aW9ucyBVc2VyIENBAgollJSAAAAAAiR9ME4GCyqGSIb3DQEJEAILMT+gPTAvMS0wKwYDVQQDEyRG
dWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVzZXIgQ0ECCiWUlIAAAAACJH0wDQYJKoZIhvcN
AQEBBQAEgYBtIK1NlsW3ADIRb01f95KP9f8gW+ituLcp5RDyzgYl3YVFAA8aff4jY0vn+oR1uR/H
XMOOv1fSog5IgQ5lJx3R7ylxaUX6bFMsDnitrHeVH/y3dAHtX95r2g89rHNLh68QL0/OhisHNx+f
kIY+MEYtcsUKzXUMDgkyW6baQXLhEwAAAAAAAA==

--=-tQkk0EbrshBrS7wPbas/--
