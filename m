Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A53EE7D98D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 20:12:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3BKC7LO002843
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Apr 2019 13:12:07 -0700 (PDT)
Received: from [172.25.59.211] (172.25.59.211) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 11 Apr 2019 13:11:56 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20190410215402.20055-1-jason.wessel@windriver.com>
	<CANNYZj8K=irJAXpTtFtaNiQ2V+dFpSPT-ikfTgK5e0TECCv_fQ@mail.gmail.com>
	<3e65af20-d2ad-603a-d121-a5982c0ae69e@windriver.com>
	<CANNYZj94F69Ske57dARqP__Yk5iiutjaqxcens6tR84sfVMF+w@mail.gmail.com>
	<847b6274-fa84-c76b-ee52-b4f884d63c0a@windriver.com>
	<CANNYZj9k0qM+O9+mVmHf1JM6MR3Cd5xbuhfZFWTqXcW+DnXb2w@mail.gmail.com>
	<6cb9ab41-778b-5e87-dfd2-88d38fec279a@windriver.com>
	<89f9a01cf5b0e87afe338360dda5057f34a60747.camel@linuxfoundation.org>
	<2E6EA27D-9294-4354-819B-5CD771285CBC@gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jason.wessel@windriver.com; prefer-encrypt=mutual; keydata=
	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
	ig4=
Message-ID: <ed1491f9-dc70-2380-f938-4b8104c86596@windriver.com>
Date: Thu, 11 Apr 2019 15:11:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2E6EA27D-9294-4354-819B-5CD771285CBC@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection.bbclass: Disable writing to $HOME/.cache/g-ir-scanner
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
X-List-Received-Date: Thu, 11 Apr 2019 20:12:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/11/19 3:01 PM, Alexander Kanavin wrote:
> Yes, I agree.
> 
> Alex
> 
>> On 11 Apr 2019, at 21.59, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Thu, 2019-04-11 at 11:36 -0500, Jason Wessel wrote:
>>>
>>> It all appears to work fine without the need to patch anything in
>>> master-next.  
>>>
>>> Thank you for the explanation.
>>
>> This is starting to look like something we probably want to pull into
>> the warrior release given the problems with meson converted recipes
>> otherwise?
>>


I concur, with Alex.  I talked to Mark Hatle about this earlier today.  If it is not fixed prior to the release of the warrior branch we were going to submit it as a back port, due to the fact this causes build stability problems. 

Jason. 

