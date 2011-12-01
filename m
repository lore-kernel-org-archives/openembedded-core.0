Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW5nF-00050S-OY for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:31:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1COWV1014887
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:24:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14826-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 12:24:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1CONTQ014881
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:24:24 GMT
Message-ID: <1322742272.17484.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 12:24:32 +0000
In-Reply-To: <cover.1322693022.git.josh@linux.intel.com>
References: <cover.1322693022.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Upgrade gthumb, claim some recipes
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
X-List-Received-Date: Thu, 01 Dec 2011 12:31:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 14:48 -0800, Joshua Lock wrote:
> This series upgrades Gthumb to 2.12.4 and updates the distro_tracking_fields
> as I'm offering to maintain some recipes without a listed maintainer:
> * gthumb
> * json-glib
> * xdg-utils
> 
> Cheers,
> Joshua
> 
> The following changes since commit 36654d6d393cb8c8a545835184a96be4ae0c885d:
> 
>   grub: Use COMPATIBLE_HOST (2011-11-30 22:21:53 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/updates
> 
> Joshua Lock (2):
>   gthumb: update to 2.12.4
>   distro_tracking_fields: update gthumb and claim some recipes

Merged to master, thanks.

Richard



