Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4z8q-0003p2-A5
	for Openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 21:02:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2012 11:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="184588499"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2012 11:49:51 -0700
Message-ID: <5037CCCE.9010603@linux.intel.com>
Date: Fri, 24 Aug 2012 11:49:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <1345706669-28914-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<503659AA.3090505@linux.intel.com> <50374DAF.7080701@linaro.org>
In-Reply-To: <50374DAF.7080701@linaro.org>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] subversion: update to 1.7.6
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
X-List-Received-Date: Fri, 24 Aug 2012 19:02:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2012 02:47 AM, Marcin Juszkiewicz wrote:
> W dniu 23.08.2012 18:26, Saul Wold pisze:
>> On 08/23/2012 12:24 AM, Marcin Juszkiewicz wrote:
>>> Dropped --without-apache option as it does not exists.
>>>
>>> Added patch from subversion-users ML to not build mod_dontdothat.
>>>
>>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>
>> I seem to be having a problem applying this patch, can you verify it or
>> resend.
>
> Exported it again and applied to other tree.
>

Worked this time, in my MUT branch for testing.

Sau!



