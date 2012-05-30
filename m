Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZhmg-00055h-8O for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:13:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC3WDJ021836
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:03:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21779-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:03:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC3Ohs021829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:03:25 +0100
Message-ID: <1338379403.20169.137.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 13:03:23 +0100
In-Reply-To: <e7dbc212a3e4ba1bccc827194fe2ed7a5cbf0889.1337952883.git.radu.moisan@intel.com>
References: <cover.1337952883.git.radu.moisan@intel.com>
	<e7dbc212a3e4ba1bccc827194fe2ed7a5cbf0889.1337952883.git.radu.moisan@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1 v2] mtd-utils: Update to version 1.5.0
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
X-List-Received-Date: Wed, 30 May 2012 12:13:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-05-25 at 17:02 +0300, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
>  .../mtd/{mtd-utils_1.4.9.bb => mtd-utils_1.5.0.bb} |    4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/mtd/{mtd-utils-1.4.9 => mtd-utils-1.5.0}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
>  rename meta/recipes-devtools/mtd/{mtd-utils_1.4.9.bb => mtd-utils_1.5.0.bb} (94%)

Merged to master, thanks.

Richard



