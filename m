Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJ49K-0004Wv-Lr
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:12:42 +0200
Received: by padfa11 with SMTP id fa11so5357074pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=GumBF59kAt1CSHgTEuw7cSSTtloeFlGLDnQnPVCOpEM=;
	b=nrdiQ5RDSqWVQZJkUSLtL7+xR4KdjXj9x6ra6Q3hske9jE0yN/ogRE81Ij51GyfOgn
	1aJ8GQXVXa/hyOqx065TfL2I9brZqIhxwAkFnwyhCz6s+VN1JJ/py/bUeu/12/6sTdUB
	NhkMDx745c0grAPlNFIrCrjLsor2KbOYvgIl2iV4Al6I3FdviYd1wP0SSgggGeB8GKSV
	RBVTN94XK03OUlYghsefkwnaTKrFuHSwNcWubV6k76ozCizKxbmpv3qy+p7hdv7ewPCh
	h9JLdbGXn9eGZR8EFRmlW6wjphUV9AfkrR/1amXxTYZ9JR8MLj2kll/lNgQnms4W0MtT
	JgGg==
MIME-Version: 1.0
Received: by 10.68.224.161 with SMTP id rd1mr5119416pbc.49.1349189972277; Tue,
	02 Oct 2012 07:59:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Tue, 2 Oct 2012 07:59:32 -0700 (PDT)
In-Reply-To: <506AFE85.9050905@linux.intel.com>
References: <1348839081-7511-1-git-send-email-otavio@ossystems.com.br>
	<506AFE85.9050905@linux.intel.com>
Date: Tue, 2 Oct 2012 11:59:32 -0300
X-Google-Sender-Auth: XhY3e-PTLACD6nfrN1oKhpO6V0M
Message-ID: <CAP9ODKrd4=nX6ZJD5=QC6PZ8OEZcoOu-O68okYrP5zFCAymviA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: Remove RCONFLICTS against xserver-xorg
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
X-List-Received-Date: Tue, 02 Oct 2012 15:12:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 2, 2012 at 11:47 AM, Saul Wold <sgw@linux.intel.com> wrote:
> Merged into OE-Core
>
> Sorry about the original mis-merge!

Thanks by merging both changes.

mis-merge happens, good we found it fast :)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


