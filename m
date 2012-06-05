Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sc1yX-0002Vv-0T for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 00:11:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q55M18Hi002875;
	Tue, 5 Jun 2012 23:01:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01600-02; Tue,  5 Jun 2012 23:01:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q55M0tN7002869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Jun 2012 23:00:59 +0100
Message-ID: <1338933654.20169.278.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jun 2012 23:00:54 +0100
In-Reply-To: <1338920130-26331-1-git-send-email-denis@denix.org>
References: <1338920130-26331-1-git-send-email-denis@denix.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] pulseaudio: fix typo in the patch name, pulseaudo -> pulseaudio
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
X-List-Received-Date: Tue, 05 Jun 2012 22:11:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-05 at 14:15 -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> No PR bump is needed.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../pulseaudio/pulseaudio_fix_for_x32.patch        |  238 ++++++++++++++++++++
>  .../pulseaudio/pulseaudo_fix_for_x32.patch         |  238 --------------------
>  .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
>  3 files changed, 239 insertions(+), 239 deletions(-)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch

Merged to master, thanks.

Richard



