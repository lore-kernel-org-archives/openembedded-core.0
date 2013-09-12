Return-Path: <stefan.seefeld@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 831DA6BE11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:14:51 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so97614oag.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 10:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=LDXCCXB9CUW2wKbw6mj5ojnAhyPAYxcAMrYI4lUKI7w=;
	b=tUEITfHjK3Hp4WUVQFkSGlGWdvdNcP6fRRrNXPuGq30Nhcxbu3cEzY4Lm/z3jULG9G
	1OdJ8bUyZEyKoZ4o/wR6MdINUDb7t95LIT1NJE3QxR1IjvHnByrpBJtt9E0dxsXqoY4a
	rvzbPppQsS0HG3Ub7738Y1kQDyJcC67Ol6fUWa1EwZcnyNEEsWpNNl9uPR3c3GcQ53RS
	ci6MnMiMVeMG09dBqzDsZbBdb8UXuqvSaM7p+++gm6Xfh4+1ojJn1C5WpERS9OE+xyBl
	7on/MZb+xKS/ZE4S5V6B8T7NcXVFau6SrOHTAlh/6oWWwOfefLLRcQIPbdoGl0aOnJ1m
	L4Tg==
X-Received: by 10.182.66.164 with SMTP id g4mr7617621obt.47.1379006093175;
	Thu, 12 Sep 2013 10:14:53 -0700 (PDT)
Received: from [192.168.2.19] (bas2-montreal29-1177924826.dsl.bell.ca.
	[70.53.180.218])
	by mx.google.com with ESMTPSA id nw5sm6824192obc.9.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 10:14:52 -0700 (PDT)
Sender: Stefan Seefeld <stefan.seefeld@gmail.com>
Message-ID: <5231F682.7000402@seefeld.name>
Date: Thu, 12 Sep 2013 13:14:42 -0400
From: Stefan Seefeld <stefan@seefeld.name>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1378948190-16620-1-git-send-email-stefan_seefeld@mentor.com>
	<1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
	<5231F61D.1040200@linux.intel.com>
In-Reply-To: <5231F61D.1040200@linux.intel.com>
Subject: Re: [PATCH] Enable ptest support for lttng.
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
X-List-Received-Date: Thu, 12 Sep 2013 17:14:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2013-09-12 13:13, Saul Wold wrote:
> 
> The usual format for the commit summary is as follows:
> 
> lttng: Enable ptest support
> 
> Please see the Commit/Patch message guideline for details:
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks, I'll follow that guideline for my next patch(es).

	Stefan


-- 

      ...ich hab' noch einen Koffer in Berlin...

