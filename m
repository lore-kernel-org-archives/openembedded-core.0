Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 094BF782B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:36:45 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v104so28059821wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 02:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=4+x6nYQZI2YcdjuQyI1+n6T6hMudnFiWAafAjG/QjrI=;
	b=SXJdyYIaEPJCPDlWyiDzdNWggcpt5zMIXJJBUOFV4XCONvqk32g5glSjEJD70BFZiA
	Xbc2KwNoxiU+XQX/vHmXYAfKC6d/qQuRBIkZ70g3iPWU8ZIDfl2ryzFvEi1RBYBCQaA3
	tzGF++6NG1hwC6yOqK+DZ+0ollUgmi6quOQ90i473OODDBXn7kiSdW9nDMi3fkAXAxIs
	oSGLfrTJMym7jxhJVCWpIxbYEkGpLvi3oj18qTsLXTSWDEzwwzSmM0xTWw8Ozf7GMBTm
	BP/xWSFJK0oEcUyHJ06hbxkp27arEXkEJjRozXOod5hYygGltA2Ey6VRZItRIYF6x1t+
	tKsw==
X-Gm-Message-State: AKS2vOwUwGItINIHNMesfGcEqY+2Uw9j5kpgietH+LEsvL5S30c9mFv5
	TiPwWXMetGJbPts1Swg=
X-Received: by 10.223.130.151 with SMTP id 23mr2324612wrc.16.1497346605980;
	Tue, 13 Jun 2017 02:36:45 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q98sm16876989wrb.3.2017.06.13.02.36.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Jun 2017 02:36:45 -0700 (PDT)
Message-ID: <1497346604.30860.4.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 10:36:44 +0100
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: busybox update?
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
X-List-Received-Date: Tue, 13 Jun 2017 09:36:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Just wondering if there's any reason why the version of busybox is stuck at
1.24.1, from October 2015? Is it simply that nobody cares? Or other reasons?

Cheers,
Andre'

