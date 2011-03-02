Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pub2s-0005YN-N1
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 02:40:06 +0100
Received: by iwn10 with SMTP id 10so5049771iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 17:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=pVX5Ooy1fBrwptJdWuWLWJqqVRGo2lVQqgfyZ1cnreY=;
	b=xQxs4gybv/KniQSPJKIjMHi2Q1CoTchnQWJA+vntX5C/y5Vx6kwUGPnRjOVZGbbuEc
	k9btlFetWOE7JZXShxnijFVWNrAHYWALnG7uHOWsEDaZ0kU8CAUuaYPOctJTayfqkn3X
	1yDEuhJVJZAx3FKn+mOM+hVYzsyC7Amvh9yUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HQNjNQDe2CVRx3lfEi7srwLR2+8OdKiIwCZQPCftz7t1bYOynDsWwmBcRf5fwUYml9
	MoHlsy+wvi8RDJYrJurXwFHDxzysCWkAiYNZcRdEQlCTl+gKAHsOHGJRjwizluYmstlj
	2IsDMaQ6PvE4eOD0/XqTTmcubzyDyUi8EN+wM=
Received: by 10.231.39.67 with SMTP id f3mr7030177ibe.42.1299029919338;
	Tue, 01 Mar 2011 17:38:39 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d21sm6206023ibg.9.2011.03.01.17.38.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 17:38:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2011 17:38:25 -0800
Message-Id: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/6] Fixes to get oe-core building
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2011 01:40:06 -0000

Hi


The attached patches are needed to get the OE core to build
Please provide feedback

Thanks

-Khem



