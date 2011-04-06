Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q7YJn-0002Un-2U
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 21:23:09 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q7YHc-0001eH-F6 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 12:20:52 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Apr 2011 12:18:43 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Wed, 6 Apr 2011 12:20:51 -0700
Message-ID: <4D9CBD0B.3090608@mentor.com>
Date: Wed, 6 Apr 2011 12:20:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1302050252.git.tom_rini@mentor.com>	<95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>	<BANLkTi=RTLB21JAz4N2B2kPWu6H3uTHn1w@mail.gmail.com>
	<1302115114.22904.77.camel@rex>
In-Reply-To: <1302115114.22904.77.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 06 Apr 2011 19:18:43.0037 (UTC)
	FILETIME=[716890D0:01CBF48F]
Subject: Re: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Wed, 06 Apr 2011 19:23:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/06/2011 11:38 AM, Richard Purdie wrote:
> On Tue, 2011-04-05 at 23:18 -0700, Khem Raj wrote:
>> On Tue, Apr 5, 2011 at 5:38 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>> The previous 5.7 release was relatively close to 5.8 due to it bringing
>>> in a patch to sync with upstream work-in-progress.  We skip over the
>>> 5.8 release and move to 5.9.
>>
>>
>> there already are patches for 5.9 available too
>> ftp://invisible-island.net/ncurses/5.9/ncurses-5.9.patch.gz
> 
> Can someone summarise what the benefits of these patches are? I'm
> trying to figure out whether we lose anything due to this upgrade or
> not...

The patches we applied to 5.7 are part of the 5.8 release and 5.9 of
course replaces 5.8.  The invisible-island.net patch sets are things
taken from the official source repo and put out there for use.

-- 
Tom Rini
Mentor Graphics Corporation


