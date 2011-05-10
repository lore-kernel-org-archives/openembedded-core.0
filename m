Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso@secretlab.ca>) id 1QJoMi-0000TH-6k
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:56:50 +0200
Received: by iye7 with SMTP id 7so5838956iye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:53:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.169.70 with SMTP id a6mr7816729icz.306.1305039236204; Tue,
	10 May 2011 07:53:56 -0700 (PDT)
Received: by 10.231.157.209 with HTTP; Tue, 10 May 2011 07:53:55 -0700 (PDT)
In-Reply-To: <1305017493.30391.253.camel@rex>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<2a89d3090044d90208c608d5f05511c03a7ca48e.1305004776.git.sgw@linux.intel.com>
	<1305017493.30391.253.camel@rex>
Date: Tue, 10 May 2011 09:53:55 -0500
Message-ID: <BANLkTim03bq62TJL9Sj2bLc3VrwTi2KUzg@mail.gmail.com>
From: Adrian Alonso <aalonso@secretlab.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailman-Approved-At: Tue, 10 May 2011 16:58:59 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/30] readline: update version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 14:56:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Unaware of delete recipe policy, there is also a recipe of readline version
5.2
should also be removed?

Send to list a patch that deletes recipe readline-6.1.bb

Regards

On Tue, May 10, 2011 at 3:51 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2011-05-09 at 22:26 -0700, Saul Wold wrote:
> > From: Adrian Alonso <aalonso@secretlab.ca>
> >
> > * Readline new recipe version 6.2
> >
> > Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
> > ---
> >  meta/recipes-core/readline/readline_6.2.bb |    6 ++++++
> >  1 files changed, 6 insertions(+), 0 deletions(-)
> >  create mode 100644 meta/recipes-core/readline/readline_6.2.bb
>
> Why is readline 6.1 being kept?
>
> Cheers,
>
> Richard
>
>


-- 
Adrian Alonso
Secret Lab Technologies Ltd.

