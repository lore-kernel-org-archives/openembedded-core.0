Return-Path: <openembedded-devel@urbanec.net>
Received: from mail16.tpgi.com.au (mail16.tpgi.com.au [203.12.160.231])
	by mail.openembedded.org (Postfix) with ESMTP id ECC3D65D56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 03:00:12 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Mon, 13 Oct 2014 14:00:11 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9D308Ef032462
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 14:00:11 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XdVri-0000iN-PL for openembedded-core@lists.openembedded.org;
	Mon, 13 Oct 2014 14:00:06 +1100
Message-ID: <543B4036.7040606@urbanec.net>
Date: Mon, 13 Oct 2014 14:00:06 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <54380BF4.6010205@urbanec.net>	 <54381C20.2060602@linux.intel.com>
	<1413011133.7562.5.camel@ted>
In-Reply-To: <1413011133.7562.5.camel@ted>
Subject: Re: [PATCH] Fix for gcc bug 61144
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Oct 2014 03:00:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/14 18:05, Richard Purdie wrote:
> On Fri, 2014-10-10 at 10:49 -0700, Saul Wold wrote:
>> Thank you for the patches.
>>
>> Please review the
>> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> Just to be clear, because of the important nature of the gcc fix and our
> looming release deadlines, Saul has sent out a version of it in this
> case. We don't normally do that.

Gentlemen,

Thanks for cleaning up the gcc patch and getting it in. Much appreciated!

As far as the pre/postrm patch is concerned, I'll resubmit a little 
later. Now that I have some feedback on the patch, I can see scope for 
improvement. When I do re-submit, I'll heed the guidelines.

Thanks for your guidance.

Peter

