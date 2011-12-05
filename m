Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RXXY3-0004G3-AP
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 13:21:31 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RXXRX-0003om-BS
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 13:14:47 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Dec 2011 12:14:46 +0000
In-Reply-To: <cover.1322102636.git.xiaofeng.yan@windriver.com>
References: <cover.1322102636.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323087287.26081.295.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 0/9] The patches to run gtk over directfb
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
X-List-Received-Date: Mon, 05 Dec 2011 12:21:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-24 at 11:06 +0800, Xiaofeng Yan wrote:
> Xiaofeng Yan (9):
>   qemu-config: Disable dbus-x11 when no x11 in DISTRO_FEATURES
>   gconf: Disable dbus-x11 when x11 isn't in DISTRO_FEATURES
>   gtk.inc: add directfb DISTRO_FEATURE
>   gtk+: add demos to the configuation of gtk+
>   cairo: add directfb DISTRO_FEATURE
>   pango: add directfb DISTRO_FEATURE
>   directfb-examples: add package directfb-examples to OE-core
>   task-gtk-directfb.bb: Add task list to run gtk over directfb
>   core-image-gtk-directfb.bb: add an image for gtk over directfb

What's the status of this patchset?  This would be useful for a project
I am working on at the moment so I am quite keen to see it get merged.
Are there any outstanding issues still?

p.




