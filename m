Return-Path: <jefro.net@gmail.com>
X-Greylist: delayed 1149 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 23:47:35 UTC
Received: from mail-lb0-f178.google.com (unknown [209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id A466560702;
	Mon, 12 May 2014 23:47:34 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id w7so8001396lbi.37
	for <multiple recipients>; Mon, 12 May 2014 16:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=q6makARq8awrCPq/PLaWqqWMSEoO3MFJTy+/iTtO534=;
	b=sInSZZwWMU8JA0eAD71NS8QHHUPqbUi2YD7nCtbIj730dbtNnHtTVyW7jPqqIYb2KY
	kHkZvH0dSqhwm9izrNejz8YzigYrbjB10YUwHCoSqH9pcDVY21/Z2+iihFAwfdDz7Eg9
	sJwCzcu9QUQ4p9r5wYAwo76D42oUlR0MCdJfZIWUSq0uJrowVjQ+HrNmnnf0/ZgMC04Q
	PKBuBVx22j3ECjjkJishwHsjQdn6g4H0tV8ajgX8mGAgPXNRofkiRO+Jmf3uBQ3/Xjbj
	Am7eOhquja6TACt2hhEgxTlFgHFh6XTdQ70smuySq6PXVjg6Q7znODoOYxv6nxvrY3yS
	ai+g==
X-Received: by 10.152.121.72 with SMTP id li8mr23060lab.45.1399936819672; Mon,
	12 May 2014 16:20:19 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.112.173.197 with HTTP; Mon, 12 May 2014 16:19:59 -0700 (PDT)
In-Reply-To: <20140507231808.GM11339@denix.org>
References: <530697CC.5050402@balister.org> <20140507231808.GM11339@denix.org>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Mon, 12 May 2014 16:19:59 -0700
X-Google-Sender-Auth: YW0di-1wcvsWbjzhIFrBcR1U3Rk
Message-ID: <CA+YB3raM8kDp_K259c-ao=nSgfvgXTmi5vpju5wAnA0WwGHH3A@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OEDAM: OpenEmbedded Developers (Americas) Meeting
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
X-List-Received-Date: Mon, 12 May 2014 23:47:36 -0000
Content-Type: text/plain; charset=UTF-8

Meeting notes have been published on the OEDAM page:

http://openembedded.org/wiki/OEDAM#Minutes

Jefro takes the blame for typos and other reporting errors.

On Wed, May 7, 2014 at 4:18 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> The OpenEmbedded Board of Directors would like to thank everyone who was able
> to participate (either in person in Santa Clara or online) in our first OEDAM
> OpenEmbedded Developers (Americas) Meeting on May 2nd and 3rd! The meeting was
> a huge success and a lot of fun!
>
> We would also like to thank Ettus Research/NI for providing the premises, as
> well as Jefro and the Yocto Project for sponsoring the event and providing
> food!
>
> The meeting minutes should be published shortly.
>
> --
> Denys
>
>
> On Thu, Feb 20, 2014 at 07:03:24PM -0500, Philip Balister wrote:
>> The OpenEmbedded Project is holding a developers meeting May 2-3,
>> 2014, in Santa Clara, CA. This meeting is immediately after the Embedded
>> Linux Conference North America. All active OpenEmbedded and Yocto
>> Project developers are invited to attend.
>>
>> NOTE: this is a development meeting for the project itself, not a
>> training session.
>>
>> May 2-3, 2014
>> time TBD
>>
>> Ettus Research/National Instruments
>> 4600 Patrick Henry Drive
>> Santa Clara, CA 95054 USA
>>
>> Lunch will be provided on both days.
>>
>> For more information and to add yourself to the list of attendees, see
>> the wiki page at
>> http://openembedded.org/wiki/OEDAM
>>
>> Here are a couple of photos from 2009:
>>
>> http://www.flickr.com/photos/32615155@N00/sets/72157622653686647/
>>
>> I'd like to thank Jefro for help with this announcement. Any errors are
>> mine though.
>>
>> Philip, OpenEmbedded eV Chair.
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Jeff Osier-Mixon @Intel
Yocto Project Community Manager http://yoctoproject.org

