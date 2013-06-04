Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5B80B6086B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 08:28:13 +0000 (UTC)
Message-ID: <51ADA51C.3030603@communistcode.co.uk>
Date: Tue, 04 Jun 2013 09:28:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CALaXJ9ka0jF6QGhBKNKi1crtn3woMQhB4sEa8Kqv3+=sZ-d4fw@mail.gmail.com>
In-Reply-To: <CALaXJ9ka0jF6QGhBKNKi1crtn3woMQhB4sEa8Kqv3+=sZ-d4fw@mail.gmail.com>
Subject: Re: Commercial usage of Yocto
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Jun 2013 08:28:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/13 05:35, Kumita Bruce wrote:
> Yocto experts,
>
> I am a learner of Yocto, Yocto is a very good tool to build images for
> embedded devices.
>
> I have one question, can Yocto be used for commercial purpose? If the
> answer is yes, what should I do before using it for commercial purpose?
>
>
> Cheers,
>
> Bruce
>
>

The important legal aspect in using the Yocto Project is not the tools 
used to build the embedded device images, but the software that is 
included in the embedded device images.

All software packages in the Yocto Project are listed with their 
respective licences. I would suggest you do some reading on Open Source 
licences (GPL, LGPL, BSD etc...) and understand the differences between 
the licensing implications of shipped and non-shipped software.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--

