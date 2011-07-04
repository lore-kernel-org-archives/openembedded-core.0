Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QdhcT-0005xa-Eg for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 13:47:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64BhQ9T017032;
	Mon, 4 Jul 2011 12:43:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17016-01; Mon,  4 Jul 2011 12:43:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64BhLFe017026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 4 Jul 2011 12:43:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309771101-19524-1-git-send-email-anders@chargestorm.se>
References: <1309771101-19524-1-git-send-email-anders@chargestorm.se>
Date: Mon, 04 Jul 2011 12:42:53 +0100
Message-ID: <1309779773.20015.664.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH] resolvconf: update to version 1.58.
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
X-List-Received-Date: Mon, 04 Jul 2011 11:47:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-04 at 11:18 +0200, Anders Darander wrote:
> The old version has become unavailable from the download site.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  .../{resolvconf_1.48.bb => resolvconf_1.58.bb}     |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-connectivity/resolvconf/{resolvconf_1.48.bb => resolvconf_1.58.bb} (87%)

Merged to master, thanks.

Richard



