Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1UVZrI-0003zt-EA; Fri, 26 Apr 2013 06:02:07 +0200
Received: by mail-da0-f42.google.com with SMTP id n15so496484dad.29
	for <multiple recipients>; Thu, 25 Apr 2013 20:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version:x-mailer;
	bh=BnX3cnvx9nmOD7C4vBnw0rk3PrMzt6RUfzlrt2vV2fQ=;
	b=OU4AlwgA5Yf0cN2auctHoAD1E3HiD2jajfh1JmO38Z/g62ENpZFbfVOXwYsxKucRhF
	L1sTkZrIKzKzmSkhO7jX7gS/k63X0XWDIst0FdE/D05JXQqgBZ7akOQbnbSEoT95MsEo
	4Y0MJ+mdXNwn2Dm2ytaFX/UA9BhXPqTVRu/MiII46wplMbxpU7ZakWK64vVOuCk2xsy4
	ZbMG8944yXXsBjHL2vSw6axJ5xyc8/KPEPSlL1Wot64HJVco2R5MnfXqx2eQWKnoYnaz
	qvjk2UKg14w6aVa4ApahFIJAJRMMDtkEaN7sBq5gVvoilelhYVImTpcMRBj4pBFhgCkX
	7pHw==
X-Received: by 10.68.130.194 with SMTP id og2mr57404482pbb.101.1366947858964; 
	Thu, 25 Apr 2013 20:44:18 -0700 (PDT)
Received: from sa-nc-common-173.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id vb8sm9819413pbc.11.2013.04.25.20.44.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 20:44:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <3018EE95-32DD-40D0-8282-BB4DF78D93C6@gmail.com>
Date: Thu, 25 Apr 2013 20:44:16 -0700
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
Subject: RFT: binutils 2.23.2 available
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 04:02:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi

I have pushed a binutils upgrade to contrib branch. I have booted =
systemd-image in all supported QEMUs using angstrom-next distro

Pease help testing it out

The branch is here

=
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/binuti=
ls-2.23.2

If you run into issues let me know

-Khem=


