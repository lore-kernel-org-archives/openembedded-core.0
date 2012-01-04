Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiETI-0002VN-25
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:12:48 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2012 16:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102880945"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 16:05:14 -0800
Message-ID: <4F0397BA.9020809@linux.intel.com>
Date: Tue, 03 Jan 2012 16:05:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325252095.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325252095.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] buildhistory: improve git commit robustness
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
X-List-Received-Date: Wed, 04 Jan 2012 00:12:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/2011 05:36 AM, Paul Eggleton wrote:
> The following change since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:
>
>    coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)
>
> is available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fix2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fix2
>
> Paul Eggleton (1):
>    buildhistory: improve git commit robustness
>
>   meta/classes/buildhistory.bbclass |   21 +++++++++++++++++----
>   1 files changed, 17 insertions(+), 4 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


