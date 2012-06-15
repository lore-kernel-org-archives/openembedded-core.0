Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sfb70-000144-3h
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 20:19:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2012 11:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="158160001"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2012 11:08:30 -0700
Message-ID: <4FDB7A1E.7020909@linux.intel.com>
Date: Fri, 15 Jun 2012 11:08:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1339429023-10291-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1339429023-10291-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH] systemtap: update Upstream-Status and use correct syntax
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
X-List-Received-Date: Fri, 15 Jun 2012 18:19:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/11/2012 08:37 AM, Andreas Müller wrote:
> patch was applied [1]
>
> http://sourceware.org/git/gitweb.cgi?p=systemtap.git;a=commit;h=41df51cb6a6d3f09f8b57cb216dffa5ba335e326
>
> Signed-off-by: Andreas Müller<schnitzeltony@googlemail.com>
> ---
>   ...prun-configure.ac-support-without-nss-for.patch |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
> index fbe7b70..eef414a 100644
> --- a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
> +++ b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
> @@ -7,7 +7,7 @@ MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
>
> -Upstream status: pending
> +Upstream-Status: Submitted
>
>   Signed-off-by: Andreas Müller<schnitzeltony@googlemail.com>
>   ---

Merged into OE-Core

Thanks
	Sau!


