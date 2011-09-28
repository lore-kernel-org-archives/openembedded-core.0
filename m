Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8wsK-000147-6E
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 18:20:48 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 09:15:13 -0700
Received: by wyh11 with SMTP id 11so169128wyh.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 09:15:12 -0700 (PDT)
Received: by 10.216.186.146 with SMTP id w18mr10949052wem.29.1317226511512;
	Wed, 28 Sep 2011 09:15:11 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id es5sm27258567wbb.11.2011.09.28.09.15.08
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 09:15:10 -0700 (PDT)
Message-ID: <4E83480A.9080407@intel.com>
Date: Wed, 28 Sep 2011 09:15:06 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1317068205.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1317068205.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/1] linux-yocto: eg20t and live boot config changes
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
X-List-Received-Date: Wed, 28 Sep 2011 16:20:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2011 01:18 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> The patch really says it all for this one. This is one update from
> Tom to remove some obselete options and the other is just a re-org
> of the live boot options and then a re-use accross the 3 boards that
> we've been using for a month or so to test CD booting.
>
> Cheers,
>
> Bruce
>
> The following changes since commit 49ed1cab3bee2318fdd5fc2538b1b3d43542ed2d:
>
>    documentation/poky-ref-manual/ref-classes.xml: documented useradd.bbclass (2011-09-25 18:00:00 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto/meta: eg20t and live boot config changes
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



