Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqLC-0002Za-2b
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:03:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Sep 2012 09:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="221131420"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 09:50:32 -0700
Message-ID: <5050BD58.90402@linux.intel.com>
Date: Wed, 12 Sep 2012 09:50:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1347356375.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1347356375.git.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] A couple of fixes for sanity.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 17:03:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 02:40 AM, Paul Eggleton wrote:
> The following changes since commit 9f0453c29891e32f8038c4bbc22ada28bfbf818a:
>
>    lib/oe/sstatesig.py: add signature data query function (2012-09-10 13:03:45 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/sanityfixes
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sanityfixes
>
> Paul Eggleton (2):
>    classes/sanity: skip tune checks if machine is invalid
>    classes/sanity: remove obsolete code
>
>   meta/classes/sanity.bbclass |   19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



