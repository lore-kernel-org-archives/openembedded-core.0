Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7c7w-0006Wf-WF
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:31:41 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2012 17:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77184188"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 17:22:44 -0700
Message-ID: <4F5FE4D4.9000708@linux.intel.com>
Date: Tue, 13 Mar 2012 17:22:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330410346-14477-1-git-send-email-james@digitalmatter.com.au>
In-Reply-To: <1330410346-14477-1-git-send-email-james@digitalmatter.com.au>
Subject: Re: [PATCH] mtd-utils: clean up old files
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
X-List-Received-Date: Wed, 14 Mar 2012 00:31:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2012 10:25 PM, James Limbouris wrote:
> Signed-off-by: James Limbouris<james@digitalmatter.com.au>
> ---
>   .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  103 ---------------
>   .../add-exclusion-to-mkfs-jffs2-git.patch          |  136 --------------------
>   .../mtd/mtd-utils/fix-ignoreerrors-git.patch       |   28 ----
>   .../mtd/mtd-utils/remove-ubi.patch                 |   35 -----
>   meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb   |   28 ----
>   5 files changed, 0 insertions(+), 330 deletions(-)
>   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils-1.4.9/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
>   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git.patch
>   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/fix-ignoreerrors-git.patch
>   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/remove-ubi.patch
>   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb
>

Merged into OE-Core

Thanks
	Sau!


