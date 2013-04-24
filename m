Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UV128-0003BY-9Y
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 16:51:17 +0200
Message-ID: <5177ED28.8000701@communistcode.co.uk>
Date: Wed, 24 Apr 2013 15:33:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
	<CAJTo0LbLaycJ1YNRynLSGPpaMWunj3e=RZFn0ENVGVqd-djJ1A@mail.gmail.com>
In-Reply-To: <CAJTo0LbLaycJ1YNRynLSGPpaMWunj3e=RZFn0ENVGVqd-djJ1A@mail.gmail.com>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: update to 1.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 14:51:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/13 15:29, Burton, Ross wrote:
> On 24 April 2013 15:26, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> - Removed upstream commited patch
>> - Updated git tag srcrev
> Under what environments was this tested?
>
> Cheers,
> Ross

Run time tested on a beaglebone, armv7a.

Specifically ethernet provisioning. I needed a patch present in 1.13  
which was my motivation for pushing ahead.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



