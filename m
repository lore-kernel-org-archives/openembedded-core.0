Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRo9s-0002SH-8S
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 18:20:36 +0200
Received: by wye20 with SMTP id 20so4853604wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 09:17:25 -0700 (PDT)
Received: by 10.216.14.31 with SMTP id c31mr5073130wec.57.1306944622668;
	Wed, 01 Jun 2011 09:10:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm847887wbh.12.2011.06.01.09.10.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 09:10:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306944074.2529.107.camel@phil-desktop>
Date: Wed, 1 Jun 2011 18:10:18 +0200
Message-Id: <CE41A629-FFAA-4A2D-9173-3BCF44CA932C@dominion.thruhere.net>
References: <1306944074.2529.107.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 16:20:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 1 jun 2011, om 18:01 heeft Phil Blundell het volgende geschreven:

> Is there any compelling reason why dbus-native needs to be built
> --with-x?  This seems to be causing quite a large stack of native X11
> packages to get built with, as far as I can tell, no useful result.

I agree, for -native --with-x is overkill

regards,

Koen


