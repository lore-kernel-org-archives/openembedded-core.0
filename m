Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.2094.1628609846598232831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 08:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id AF30A200002;
	Tue, 10 Aug 2021 15:37:24 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/1] Proposing to maintain alsa-*, flac, lame and speex
Date: Tue, 10 Aug 2021 17:37:14 +0200
Message-Id: <20210810153715.141067-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the project is looking for recipe maintainers, I've volunteering
to help with maintaining some sound related recipes.

I have some intermediate level experience using these packages,
but proposing this is a way for me to get more familiar with the project
development and QA process, in addition to contributing to the
project, of course.

Michael Opdenacker (1):
  maintainers.inc: maintainer for alsa-*, flac, lame and speex

 meta/conf/distro/include/maintainers.inc | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

-- 
2.25.1

