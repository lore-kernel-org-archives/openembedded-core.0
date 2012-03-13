Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UhG-0003eC-TS
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:35:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2012 09:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118342742"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by azsmga001.ch.intel.com with ESMTP; 13 Mar 2012 09:26:13 -0700
Message-ID: <4F5F7525.7020508@linux.intel.com>
Date: Tue, 13 Mar 2012 09:26:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331277565.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1331277565.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 0/1] a fix to 2067
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
X-List-Received-Date: Tue, 13 Mar 2012 16:35:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2012 11:19 PM, Dexuan Cui wrote:
> The following changes since commit 6bd23e0faf329f086bb4885991ce5f5d095dac56:
>
>    adt-installer: Corrected wrong environment file names. (2012-03-08 12:18:52 -0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/fix_2067
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/fix_2067
>
> Dexuan Cui (1):
>    image_types: ensure .rootfs.ext3 is created before vmdk is created.
>
>   meta/classes/image_types.bbclass |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


