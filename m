Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QV2PW-0006Ak-RC
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:10:06 +0200
Received: by wye20 with SMTP id 20so2112196wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 07:06:46 -0700 (PDT)
Received: by 10.227.55.129 with SMTP id u1mr1766472wbg.85.1307714805860;
	Fri, 10 Jun 2011 07:06:45 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm14sm2053479wbb.41.2011.06.10.07.06.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2011 07:06:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 10 Jun 2011 16:06:43 +0200
Message-Id: <25C444E8-9FBC-4674-B366-ADCE39FC666B@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: meta-gnome update
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
X-List-Received-Date: Fri, 10 Jun 2011 14:10:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

For people not keeping an eye on meta-gnome, it reached a milestone this =
week: a usefull looking[1] GNOME 2.32 desktop. With the current bits in =
oe-core, meta-oe and meta-gnome you can build an image with gdm, =
gnome-panel, gnome-session, nautilus metacity and gnome-disk-utility. =
It's still lacking things like gnome-control-center, =
gnome-settings-daemon, totem, etc.

If you're using meta-angstrom you can build systemd-gnome-image which =
willl give you the above.

Give it all a try and send lots of patches to move over your favourite =
GNOME recipes :)

regards,

Koen

[1] It's not actually usefull, it just looks that way :)=


