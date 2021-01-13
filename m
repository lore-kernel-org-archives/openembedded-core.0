Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8022.1610545506734126492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 05:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4646C1042
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 05:45:06 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56943F70D
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 05:45:05 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] common-licenses: add BSD-3-Clause-Clear license
Date: Wed, 13 Jan 2021 13:45:00 +0000
Message-Id: <20210113134500.1571067-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113134500.1571067-1-ross.burton@arm.com>
References: <20210113134500.1571067-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Adrian Herrera <adrian.herrera@arm.com>

See https://spdx.org/licenses/BSD-3-Clause-Clear.html

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: I2b7e0ad060fac6b473ce4d0bab839253aee9873d
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
2.25.1

