Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCuXc-00036i-60
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 16:39:49 +0200
Received: by bke11 with SMTP id 11so7411176bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 07:34:08 -0700 (PDT)
Received: by 10.223.4.132 with SMTP id 4mr25362476far.12.1318170848686;
	Sun, 09 Oct 2011 07:34:08 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id g19sm25499043fai.8.2011.10.09.07.34.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Oct 2011 07:34:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 9 Oct 2011 16:34:05 +0200
Message-Id: <3641B9F4-58D3-4AA1-B3D8-A08C57A97A11@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: shared-mime-info fails to build if intltool-native is present
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
X-List-Received-Date: Sun, 09 Oct 2011 14:39:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I finally tracked down the cause of the intermittent shared-mime-info =
build failures I was seeing. No patch yet, but now you all know what's =
causing it :)

regards,

Koen=


