Received: from C02VH2K5HV2R.localdomain (C02VH2K5HV2R.localdomain [81.96.232.39])
 by mx.groups.io with SMTP id smtpd.web11.502.1611867058542920824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 12:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: c02vh2k5hv2r.localdomain, ip: 81.96.232.39, mailfrom: adrher02@c02vh2k5hv2r.localdomain)
Received: by C02VH2K5HV2R.localdomain (Postfix, from userid 501)
	id D49DB983CB04; Wed, 16 Dec 2020 09:58:38 +0000 (GMT)
From: "Adrian Herrera" <adrian.herrera@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Herrera <adrian.herrera@arm.com>
Subject: [PATCH] common-licenses: add BSD-3-Clause-Clear license
Date: Wed, 16 Dec 2020 09:57:52 +0000
Message-Id: <20201216095752.51871-1-adrian.herrera@arm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

See https://spdx.org/licenses/BSD-3-Clause-Clear.html

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
---
 meta/files/common-licenses/BSD-3-Clause-Clear | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Clear

diff --git a/meta/files/common-licenses/BSD-3-Clause-Clear b/meta/files/c=
ommon-licenses/BSD-3-Clause-Clear
new file mode 100644
index 0000000000..c6e95da6aa
--- /dev/null
+++ b/meta/files/common-licenses/BSD-3-Clause-Clear
@@ -0,0 +1,32 @@
+The Clear BSD License
+
+Copyright (c) [xxxx]-[xxxx] [Owner Organization]
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted (subject to the limitations in the disclaime=
r
+below) provided that the following conditions are met:
+
+     * Redistributions of source code must retain the above copyright no=
tice,
+     this list of conditions and the following disclaimer.
+
+     * Redistributions in binary form must reproduce the above copyright
+     notice, this list of conditions and the following disclaimer in the
+     documentation and/or other materials provided with the distribution=
.
+
+     * Neither the name of [Owner Organization] nor the names of its
+     contributors may be used to endorse or promote products derived fro=
m this
+     software without specific prior written permission.
+
+NO EXPRESS OR IMPLIED LICENSES TO ANY PARTY'S PATENT RIGHTS ARE GRANTED =
BY
+THIS LICENSE. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, B=
UT NOT
+LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDE=
R OR
+CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFI=
TS; OR
+BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WH=
ETHER
+IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWIS=
E)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF T=
HE
+POSSIBILITY OF SUCH DAMAGE.
--=20
2.29.2

