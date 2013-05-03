Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UYCJj-00008Q-KH
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 11:30:15 +0200
Received: by mail-vb0-f43.google.com with SMTP id p14so1201893vbm.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2013 02:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=0Bjt8ewoF6SsR2svE4NzZiSzd6OjidZ4wP//1I1qOQk=;
	b=F+4OuY7c5TcARfQ/gKz1VJBkoBD0VyrZyFqwkEJxBFVFp5HHk6xuh47aXmDQccmC+o
	3I47XSaMC0gCnNGRgKAFZL/sJaOfyCwNh5gEAZjImnk38hxJg5UjaZXPsVPp2BjdMwdZ
	hVJHSHTokJQ6fGa2UNam4C/dbzidVPmf7SiMx0Ti050sQkv3MN7xCivt3O4385ifYzOq
	Fird1roneJeTjrc9K76bUNt6saFDH+/zmCF5If9biEwyanosfA2xVOkilGUQ+q2OcO1t
	j5rVR//Anu+061LL447cOgxHXI0C65vuUQpCzjXMOrIAnwgtw9mXtIsXUyVtfmxoZrkk
	YZRA==
X-Received: by 10.220.176.71 with SMTP id bd7mr3341507vcb.12.1367572340409;
	Fri, 03 May 2013 02:12:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Fri, 3 May 2013 02:12:00 -0700 (PDT)
In-Reply-To: <1367527405-9831-1-git-send-email-net147@gmail.com>
References: <1367527405-9831-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 May 2013 10:12:00 +0100
Message-ID: <CAJTo0LbTb-e=9498hrOMuYXev4SL7YnV9X5tyDq_q6yiOU_C6A@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQlLhkjJsv+GcjL1yQ57oe+ftCY6Gvi2K+iVfCwkjKo1xn8/2Lm6Sj4M9pFxlwsyH84BddEF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] guile: Update to 2.0.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 09:30:26 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2013 21:43, Jonathan Liu <net147@gmail.com> wrote:
> fix_parallel_build_issue.patch is now part of upstream.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


