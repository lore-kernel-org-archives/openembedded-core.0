Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmEEL-0005hg-MQ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:13:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 17:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="32322805"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 17:09:21 -0700
Message-ID: <4E30A8B1.6080601@linux.intel.com>
Date: Wed, 27 Jul 2011 17:09:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311694250.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1311694250.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/4] local.conf.sample cleanup for OE-core
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
X-List-Received-Date: Thu, 28 Jul 2011 00:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2011 08:33 AM, Paul Eggleton wrote:
> The following changes since commit dad2169cfb331b7af5c6d380347ea279a59bd716:
>
>    classes/image_types: IMAGE_TYPES was missing some entries (2011-07-26 15:52:40 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/local-conf-cleanup-core
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/local-conf-cleanup-core
>
> Paul Eggleton (4):
>    meta/conf/local.conf.sample: remove oprofileui-native related
>      settings
>    meta/conf/local.conf.sample: improve comments/layout
>    meta/conf/local.conf.sample: improve terminal examples/comments
>    meta/conf/local.conf.sample: remove nonfunctional BBINCLUDELOGS
>      setting
>
>   meta/conf/local.conf.sample |   38 +++++++++++++++++++-------------------
>   1 files changed, 19 insertions(+), 19 deletions(-)
>

Merged into oe-core, except the last one per comments from Phil

Sau!


