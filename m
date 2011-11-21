Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RSXDD-0000E1-MP for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 17:59:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALGqnHh009193;
	Mon, 21 Nov 2011 16:52:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09153-01; Mon, 21 Nov 2011 16:52:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALGqeH3009169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Nov 2011 16:52:41 GMT
Message-ID: <1321894365.18926.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 Nov 2011 16:52:45 +0000
In-Reply-To: <1321782765-28952-1-git-send-email-koen@dominion.thruhere.net>
References: <1321782765-28952-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] dbus: update to 1.4.16
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
X-List-Received-Date: Mon, 21 Nov 2011 16:59:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-11-20 at 10:52 +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../dbus/{dbus-1.4.12 => dbus-1.4.16}/dbus-1.init  |    0
>  .../dbus/{dbus-1.4.12 => dbus-1.4.16}/tmpdir.patch |    0
>  meta/recipes-core/dbus/dbus_1.4.12.bb              |    7 -------
>  meta/recipes-core/dbus/dbus_1.4.16.bb              |    5 +++++
>  4 files changed, 5 insertions(+), 7 deletions(-)
>  rename meta/recipes-core/dbus/{dbus-1.4.12 => dbus-1.4.16}/dbus-1.init (100%)
>  rename meta/recipes-core/dbus/{dbus-1.4.12 => dbus-1.4.16}/tmpdir.patch (100%)
>  delete mode 100644 meta/recipes-core/dbus/dbus_1.4.12.bb
>  create mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb

Merged to master, thanks.

Richard



