Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QhjoG-0008Gh-KO
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 16:56:08 +0200
Received: by wyg30 with SMTP id 30so959896wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 07:52:07 -0700 (PDT)
Received: by 10.216.20.143 with SMTP id p15mr587888wep.0.1310741527750;
	Fri, 15 Jul 2011 07:52:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h47sm807397wed.1.2011.07.15.07.52.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 07:52:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <769b19321ac3436a2b3e2bc7db4204aca0449f94.1310735644.git.paul.eggleton@linux.intel.com>
Date: Fri, 15 Jul 2011 16:52:04 +0200
Message-Id: <76BA0D0F-4665-4D73-A7F3-C8D4401F5DC2@dominion.thruhere.net>
References: <cover.1310735644.git.paul.eggleton@linux.intel.com>
	<769b19321ac3436a2b3e2bc7db4204aca0449f94.1310735644.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/3] classes: remove classes that don't belong in oe-core
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
X-List-Received-Date: Fri, 15 Jul 2011 14:56:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 jul 2011, om 15:17 heeft Paul Eggleton het volgende geschreven:

> These classes are not used within oe-core and really belong in an =
upper
> layer that makes use of them, if they are still useful:
>=20
> * mozilla.bbclass
> * openmoko*.bbclass
> * srec.bbclass
> * xfce.bbclass

I'll take patches to add those to meta-xfce and meta-oe if people are =
interested=


