Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 77C446E8DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 10:07:02 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id j15so21772825qaq.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 02:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jy6Rerd+79Vgoef9K0Op9osa/9YpkLQMyvrMsJBbjQE=;
	b=Sd3cfy9N1TKsRz8yID4IK8tkbsiysdpCIOU5I1ORMw4qVnspv+1ELLDpJoc84ujJ4V
	C7IsNX5DcZ2JFDadovdMSMQIRTo+b6UezMDr5cKea1IqhAiRyMO8efF19wWiWZC4zOyW
	LX+d9oJawl50/8fvUm/BSgRpd0ZYMLCdxljbxAMJqhvoMcq0EmcIa0lXTJwCGx8AkZmK
	dzUQ7MkXbA3XyLeqv/XseQQAdFgKNsI/moQKxRuAWuePaqwyjBVtEgqFzE6O/1OuHoeA
	v0eD7YkEEfqIo1qPWBUkN0L0P0H9qG8ZA9QlhhI3t4ArXn0Bme03glgRhRgm8ut8mnHN
	HQcg==
X-Gm-Message-State: ALoCoQlaF07O5tioz7+jWn72OLrNLsUTtG7rw/gw40nDthNVghW+JTkf9kYtuqGTzsJdF4weqoko
X-Received: by 10.229.127.72 with SMTP id f8mr33076782qcs.12.1392631622944;
	Mon, 17 Feb 2014 02:07:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 17 Feb 2014 02:06:42 -0800 (PST)
In-Reply-To: <20140217085816.GO10078@lpalcu-linux>
References: <cover.1392625337.git.sgw@linux.intel.com>
	<cf0e00e6b461971018da7eb5d0369eac048ad15d.1392625337.git.sgw@linux.intel.com>
	<20140217085816.GO10078@lpalcu-linux>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Feb 2014 10:06:42 +0000
Message-ID: <CAJTo0LYFG8gbRtHanFKPUquqYjPmGpFC8JbXxwZjM4MG_6o10Q@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] lsbinitscripts: Update to 9.52
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
X-List-Received-Date: Mon, 17 Feb 2014 10:07:02 -0000
Content-Type: text/plain; charset=UTF-8

On 17 February 2014 08:58, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Am I missing something?

Looks like the remains from a rebase when there were two versions of
the patch in circulation.

Ross

