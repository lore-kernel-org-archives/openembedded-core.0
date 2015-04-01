Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id B0B9860034
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 03:31:58 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so41042945pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=O7djgbjtEBrHvzLehsg1eFAz7mWoH/ppYTi/HflWeh8=;
	b=HjFV4P0ssVltyAEtC4FJvEmWjrxvAmkk3Bl136qahY6X8rELeyN/sPOUZXEFPX4KU0
	MQS4/tEw0IskdzOTq/CEtVUWF4/Rh4KeMG4IUpDSOCL7OV/EpGDBXYS/SmwNISY0czU2
	O5RevpTW4oA248RDLpoT2dAjEvYqldXknu5ljS+gmJNIT6SM3yo2Kww7kznuyehEj+P9
	fNlZ9aNgQmexLD0fkAb5SK7I7fyMUUb1EjCXrcfXM5m2AuBvQ5TfmftuO8ZuYVRio3UX
	JjPpCPQ9f9WkywwrpOrEDa++arRNiMpHQ4dC3EcFz1FKioln5TzwPWDtnpkG+xICi4gt
	/yyg==
X-Received: by 10.66.231.204 with SMTP id ti12mr73432081pac.135.1427859120023; 
	Tue, 31 Mar 2015 20:32:00 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:19fb:8697:69c9:14f6?
	([2601:9:3580:84c:19fb:8697:69c9:14f6])
	by mx.google.com with ESMTPSA id n5sm401052pdn.63.2015.03.31.20.31.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 31 Mar 2015 20:31:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <AB2B8D4E-10BB-47FF-891E-2104C8C889C2@gmail.com>
Date: Tue, 31 Mar 2015 20:31:58 -0700
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
X-Mailer: Apple Mail (2.2070.6)
Subject: Are we open for intrusive changes on master now
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
X-List-Received-Date: Wed, 01 Apr 2015 03:32:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi

I have few patches pending on

http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/master=


except two commits 1. glibc and 2. gcc-5.0 upgrade

all are potential candidates I would like to propose ( as of now )

Since these are quite intrusive patches, I would like to have them in =
early for next release cycle

-Khem


