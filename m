Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rlg0M-0004Fi-O5
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 13:13:10 +0100
Received: by wgbdt11 with SMTP id dt11so2913199wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 04:05:38 -0800 (PST)
Received: by 10.180.80.164 with SMTP id s4mr1223362wix.7.1326456338572;
	Fri, 13 Jan 2012 04:05:38 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	fv13sm10786103wbb.21.2012.01.13.04.05.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jan 2012 04:05:38 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <bc6335972ec83f47469f18ac973f057b3323b46d.1326454446.git.dongxiao.xu@intel.com>
Date: Fri, 13 Jan 2012 13:05:36 +0100
Message-Id: <998E113C-60A0-4034-AEC7-57D61F41915C@dominion.thruhere.net>
References: <cover.1326454446.git.dongxiao.xu@intel.com>
	<bc6335972ec83f47469f18ac973f057b3323b46d.1326454446.git.dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/3] packageinfo.bbclass: add a new bbclass to pass package information
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
X-List-Received-Date: Fri, 13 Jan 2012 12:13:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 13 jan. 2012, om 12:38 heeft Dongxiao Xu het volgende geschreven:

> packageinfo.bbclass is to pass the accurate package information to
> clients (e.g. Hob), including PN, PV, RDEPENDS, PKGSIZE, etc.

How many classes for package/recipe info do we actually need?


