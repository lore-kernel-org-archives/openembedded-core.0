Return-Path: <jefro.net@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5A14461FB9;
	Fri,  7 Jun 2013 22:31:11 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id n12so1721814wgh.3
	for <multiple recipients>; Fri, 07 Jun 2013 15:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=F+1hJuz0IAPJKflsGzgv78J+QfRtZ4ED8HirNyzFFus=;
	b=i56F/9gcTK4H0YpKPZb/SfGjx2CKNDwZi/XEvmLpJaJ1gFLKWpNQyR7AC2gLG1FEkV
	3fDHbDDumr2bNU83OQIOE8qj1E50tpOtnItTREGOaRInt7+mTuCwztVwY86sYUT+uzjl
	XfwQljMCjaNRNrp2BWgRInIizaggTwD03DozvflnXtgsfnGMR2uXJ/SB4BeBVVju0FY9
	mStZIik+zQkreOsRrDedXAW/i4s0mYiBW6/RdM8q9c9xYCq2oz1Nfixe7CP55+F6XVjg
	YV73mZ//VZddxcgBBcZHMZLa2ihbaxEpTSZ2IQgpqjd6VRpfL38AN1NuNOpoSUtyF+NE
	PEWg==
X-Received: by 10.180.206.205 with SMTP id lq13mr352597wic.42.1370644271619;
	Fri, 07 Jun 2013 15:31:11 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.180.185.179 with HTTP; Fri, 7 Jun 2013 15:30:51 -0700 (PDT)
In-Reply-To: <20130607222052.GN22710@jama>
References: <CA+YB3rZ+pWVzy6_=PAa9QRTdsu+Y5OEGwdW7sLpLphnWZ-89yw@mail.gmail.com>
	<20130607222052.GN22710@jama>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 7 Jun 2013 15:30:51 -0700
X-Google-Sender-Auth: v438-fDFcuvMz6BY-8CIFUr-wyg
Message-ID: <CA+YB3rZ3ZqF+jbEHjtQvgwEG7bJNwtcOtgent77nhAqHjC1YXw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE TSC Minutes 4 June 2013
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
X-List-Received-Date: Fri, 07 Jun 2013 22:31:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

cc bluelightning

On Fri, Jun 7, 2013 at 3:20 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> a. oe-classic recipe migration status
>> drop from agenda after this
>
> Not sure why I got this idea now when it's "over" but would it be
> possible to populate new layerindex with at least recipe names from
> OE-classic?
>
> I guess it would be hard to parse it completely as proper layer,
> but it would be nice to search for "foo" and see that it's available in
> OE-classic ready to be migrated to some layer - otherwise people will
> just start from scratch which isn't always best way.
>
> Even just names from migration wiki page would be enough to give people
> heads-up that something similar is in OE-classic.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

