Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWpwM-0007k6-L8
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 15:15:26 +0200
Received: by wye20 with SMTP id 20so315490wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 06:12:00 -0700 (PDT)
Received: by 10.227.162.200 with SMTP id w8mr560587wbx.114.1308143520127;
	Wed, 15 Jun 2011 06:12:00 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb6sm345099wbb.0.2011.06.15.06.11.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 06:11:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308135814.25285.1459.camel@phil-desktop>
Date: Wed, 15 Jun 2011 15:11:56 +0200
Message-Id: <61DEF148-0B41-4386-BDAE-B607796C2D71@dominion.thruhere.net>
References: <1308135814.25285.1459.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: criteria for oe-core?
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
X-List-Received-Date: Wed, 15 Jun 2011 13:15:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 jun 2011, om 13:03 heeft Phil Blundell het volgende geschreven:

> I'm still a bit unclear on what exactly are the criteria for =
determining
> whether a given recipe should go into oe-core, some other layer (e.g.
> meta-oe) or both places.  Is there a document somewhere which explains
> this?

I've been using this one:

Put it in meta-oe untill too many people complain about needing meta-oe =
just for that recipe

Some more clarification on the oe-core side would be nice to have, I =
tried to start the GNOME side of the conversation, but not much response =
to that yet.

regards,

Koen=


