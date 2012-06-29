Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ske1w-0005Wy-S7
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 18:26:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2012 09:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="159767599"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2012 09:15:51 -0700
Message-ID: <4FEDD4B7.1000305@linux.intel.com>
Date: Fri, 29 Jun 2012 09:15:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340887435-30694-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1340887435-30694-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] qt4e-demo-image: new description
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
X-List-Received-Date: Fri, 29 Jun 2012 16:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2012 05:43 AM, Valentin Popa wrote:
> (-) replaced qt4e-demo-image description
>
> [YOCTO #2636]
>
> Signed-off-by: Valentin Popa<valentin.popa@intel.com>
> ---
>   meta/recipes-qt/images/qt4e-demo-image.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
> index 794dac5..8f9478d 100644
> --- a/meta/recipes-qt/images/qt4e-demo-image.bb
> +++ b/meta/recipes-qt/images/qt4e-demo-image.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION = "Version 1.0-r1 of the qtr3-demo-image."
> +DESCRIPTION = "An image that will launch into the demo application for the embedded (not based on X11) version of Qt."
>   LICENSE = "MIT"
>   PR="r2"
>

Merged into OE-Core

Thanks
	Sau!


