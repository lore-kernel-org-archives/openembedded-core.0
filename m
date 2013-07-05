Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id BAE6E6AA07
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 11:18:10 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id gf11so1530913vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 04:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Pc3puCnPd+Fi/tn6F1/Euusxl4odqURWOHqXG7sr3aY=;
	b=RAuxfzK2FSyo7Dwxf5pj9IJRk/wkXOUDgmBQ6p6mFtdJIW/MkQiT/3Iyx0fgT3pyf8
	A8/pDAJ8d/B6dLkGZNDZixMmCZ11FiQCLe+OxhTKiQWwf/5+W462h0TQZuaKmN/mSucl
	5cMvQi82dtqyChX7k9ayMpje0Vx+QCVutSExlXp16mSc0NmcEm1CnZ7956IMhMsDqjck
	dK+kODLfsVRwgmK2h1FZbJISjk7eDGg61pMn0dytD345kgS0wp6ZWcSLCVNpN4XRkR+8
	ELup3zOBsgu04cOfmrcGLjgQhftmyrdXiQW68ZHJQOAyj4EiM4e5VcC9TlYfr4xfj0fn
	VZNA==
X-Received: by 10.52.163.46 with SMTP id yf14mr5252151vdb.58.1373023091260;
	Fri, 05 Jul 2013 04:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 5 Jul 2013 04:17:51 -0700 (PDT)
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jul 2013 12:17:51 +0100
Message-ID: <CAJTo0LYxxD_Dt+w=Xknf9UOhUwAD7EZqL2=KMgoQ4p4aG4V0tw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQlOsAXL3wyaj9dlH76E+q2JjC5JVq6cgPT2jtLV74wBrABv9/uTXZJn60wWYOPViDjI51d9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] Missing deps discovered in per-recipe builds
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
X-List-Received-Date: Fri, 05 Jul 2013 11:18:11 -0000
Content-Type: text/plain; charset=UTF-8

On 5 July 2013 02:28, Martin Jansa <martin.jansa@gmail.com> wrote:
> I was using simple script to build each component alone:

I was literally going to write this script on Monday, great stuff.
Surprisingly few patches for oe-core! :)

Ross

