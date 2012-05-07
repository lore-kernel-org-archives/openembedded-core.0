Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRQmj-0002R9-TA
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 18:27:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2012 09:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="137851087"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2012 09:17:50 -0700
Message-ID: <4FA7F5AE.5040706@linux.intel.com>
Date: Mon, 07 May 2012 09:17:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335967122.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 0/2] glib-2.0 another upgrade
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
X-List-Received-Date: Mon, 07 May 2012 16:27:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2012 06:59 AM, Martin Jansa wrote:
> This depends on previous glib-2.0 upgrade patchset which is already in master-next
>
> The following changes since commit 26d822ad059dd4839cc6fee2a65714e73cc146e1:
>
>    nfs-utils: don't try to unload nfsd module (2012-05-01 14:28:47 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>
> Martin Jansa (1):
>    glib-2.0: upgrade to 2.32.2
>
> Tomas Frydrych (1):
>    site/arm-common: alignment values for guin32, guin64 and unsigned
>      long
>
>   .../{glib-2.0_2.32.1.bb =>  glib-2.0_2.32.2.bb}     |    5 ++---
>   meta/site/arm-common                               |    3 +++
>   2 files changed, 5 insertions(+), 3 deletions(-)
>   rename meta/recipes-core/glib-2.0/{glib-2.0_2.32.1.bb =>  glib-2.0_2.32.2.bb} (92%)
>
Merged into OE-Core

Thanks
	Sau!


