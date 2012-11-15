Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TZ2yr-0004CH-2O
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 18:11:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2012 08:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,258,1352102400"; d="scan'208";a="242756657"
Received: from elitebook.jf.intel.com (HELO [10.7.202.56]) ([10.7.202.56])
	by orsmga002.jf.intel.com with ESMTP; 15 Nov 2012 08:57:37 -0800
Message-ID: <50A51F01.107@intel.com>
Date: Thu, 15 Nov 2012 18:57:37 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1352841144-31228-1-git-send-email-radu.moisan@intel.com>
	<50A2D2BD.9090703@linux.intel.com> <50A3F364.1010509@intel.com>
	<CAJTo0LY8JXsCKPZyWQ2xMDWy57nXb3BL1Ur_+Lck7AitPU3=9Q@mail.gmail.com>
	<CAP9ODKrt_PSQzvR2GqwAQHo33sYQHoWwwyyixo-X55_HRo0osA@mail.gmail.com>
In-Reply-To: <CAP9ODKrt_PSQzvR2GqwAQHo33sYQHoWwwyyixo-X55_HRo0osA@mail.gmail.com>
Cc: Alexandru Damian <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] initrd: add recovery feature
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
X-List-Received-Date: Thu, 15 Nov 2012 17:11:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2012 04:42 PM, Otavio Salvador wrote:
>
> Radu, please drop it or set it for 20s or so. I am against the timeout 
> as a whole as in case this causes a boot fail it will be quite 
> difficult to average user to come up to realize the cause of the 
> problem so my opinion would be to drop it completely.
Ok guys, it fine with me to drop it then.

Radu


